# bOCR: Advanced OCR Framework with Vision LLMs

**bOCR** is a high-performance Optical Character Recognition (OCR) framework that uses Vision Large Language Models (VLLMs) for accurate text extraction and document processing. Designed for efficiency and modularity, it simplifies OCR workflows with minimal setup.

## Features

- **Minimal Setup**: Requires just a single backbone file (e.g., `qwen.py` or `ollamas.py`) for OCR execution, making it lightweight and easy to use.
- **Broad Vision LLM Support**: Integrates with vision LLMs like `Qwen`, `Llama`, `Phi`, and various VLLMs included in the `Ollama` package.
- **Customizable Prompts**: Fine-tune OCR output using either a custom or default prompt.
- **Automated Preprocessing**: Image denoising, resizing, and PDF-to-image conversion.
- **Postprocessing & Export**: Supports merging pages and multiple export formats (`plain`, `markdown`, `docx`, `pdf`).
- **Configurable Pipeline**: A single `Config` object centralizes OCR settings.
- **Detailed Logging**: Integrated verbose logging for insights and debugging.

---

## Installation

### Install from PyPI (Recommended)

```bash
pip install bocr
```

### Install from Source (Development Version)

```bash
git clone https://github.com/adrianphoulady/bocr.git
cd bocr
pip install .
```

---

## Quick Start

### Simple Example (Single File OCR)

Any backbone file in the `backbones` module, like `qwen.py`, is all you need to run OCR on an image:

```python
from bocr.backbones.qwen import extract_text

result = extract_text("sample1.png")
print(result)
```

---

### Advanced Usage

```python
from bocr import Config, ocr

config = Config(model_id="Qwen/Qwen2-VL-7B-Instruct", export_results=True, export_format="pdf", verbose=True)
files = ["sample2.pdf"]
results = ocr(files, config)
print(results)
```

### Command Line Example

```bash
bocr sample1.jpg --export-results --export-format docx --verbose
```

---

## Configuration

The `Config` class centralizes OCR settings. Key parameters:

| Parameter        | Type         | Description                                            | Default                       |
|------------------|--------------|--------------------------------------------------------|-------------------------------|
| `prompt`         | `str`/`None` | Custom OCR prompt or `None` for default.               | `None`                        |
| `model_id`       | `str`        | Vision LLM model identifier.                           | `Qwen/Qwen2.5-VL-3B-Instruct` |
| `max_new_tokens` | `int`        | Max tokens generated by model.                         | `1024`                        |
| `preprocess`     | `bool`       | Enable preprocessing of input files.                   | `False`                       |
| `resolution`     | `int`        | DPI for PDF-to-image conversion.                       | `150`                         |
| `max_image_size` | `int`/`None` | Resize images to a max size. No resizing if `None`.    | `1920`                        |
| `result_format`  | `str`        | Output format (`plain`, `markdown`).                   | `md`                          |
| `merge_text`     | `bool`       | Merge extracted text.                                  | `False`                       |
| `export_results` | `bool`       | Save results to files.                                 | `False`                       |
| `export_format`  | `str`        | File output format (`txt`, `md`, `docx`, `pdf`).       | `md`                          |
| `export_dir`     | `str`/`None` | Directory for output files. `./ocr_exports` if `None`. | `None`                        |
| `verbose`        | `bool`       | Enables detailed logging for debugging.                | `False`                       |

---

## OCR Pipeline

### 1. Preprocessing

- **URL Handling**: Downloads remote files if input is a URL.
- **PDF Conversion**: Converts PDFs into image format (requires `poppler` installed and in `PATH`).
- **Image Enhancement**: Applies denoising and contrast adjustment.
- **Resizing**: Optimizes images for Vision LLMs.

### 2. Text Extraction

- Extracts text using Vision LLMs, with support for custom prompts for tailored OCR instructions.

### 3. Postprocessing

- Formats and merges extracted text in specified format.
- Converts it into specified export formats (e.g., Markdown, PDF).
- Saves results if configured.

---

## Logging

Enable logging by setting `verbose=True` in the `Config` object. Logs provide insights into preprocessing, extraction, and postprocessing steps.

---

## Dependencies

bOCR uses a `pyproject.toml` for managing dependencies instead of `requirements.txt`. Ensure you have `pip>=21.1` to install directly from `pyproject.toml`.

### Required External Dependencies

Additionally, `poppler` is required for PDF processing, and `pandoc` is required for DOCX and PDF export.

#### **Poppler (Required for PDF Processing)**
- **Ubuntu/Debian**:
  ```bash
  sudo apt install poppler-utils
  ```
- **macOS** (via Homebrew):
  ```bash
  brew install poppler
  ```
- **Windows**:
  1. Download the latest Poppler binaries from [https://github.com/oschwartz10612/poppler-windows/releases](https://github.com/oschwartz10612/poppler-windows/releases).
  2. Extract and place the `bin/` directory path in your system `PATH` environment variable.

#### **Pandoc (Required for DOCX, PDF Export)**
- **Ubuntu/Debian**:
  ```bash
  sudo apt install pandoc
  ```
- **macOS** (via Homebrew):
  ```bash
  brew install pandoc
  ```
- **Windows**:
  1. Download the installer from [https://pandoc.org/installing.html](https://pandoc.org/installing.html).
  2. Run the installer and ensure Pandoc is added to your system `PATH`.

---

## Supported Models

bOCR supports Vision LLMs such as:

- `Qwen/Qwen2-VL-2B-Instruct`
- `Qwen/Qwen2-VL-7B-Instruct`
- `Qwen/Qwen2-VL-72B-Instruct`
- `Qwen/QVQ-72B-Preview`
- `meta-llama/Llama-3.2-11B-Vision-Instruct`
- `meta-llama/Llama-3.2-90B-Vision-Instruct`
- `microsoft/Phi-3.5-vision-instruct`
- `llama3.2-vision:11b` from Ollama
- `llama3.2-vision:90b` from Ollama

Additional models can be supported by implementing a new backbone in `bocr/backbones/` and updating `mappings.yaml`.

---

## License

This project is licensed under the MIT License.

