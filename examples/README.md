# bOCR Examples

This directory contains sample files for demonstrating the performance and usage of the **bOCR** Optical Character Recognition (OCR) framework.

## Sample Files

The following files are included for testing and benchmarking:

- `sample1.jpg` – A scanned image of handwritten text for OCR processing.
- `sample2.pdf` – A PDF document for demonstrating multi-page OCR capabilities.

### Sources

The examples used in this repository are publicly available materials provided for demonstration purposes. Their sources are:

- `sample1.jpg`: NDJ Tuition – [Classification of Elements and the Periodic Table](https://www.ndjtuition.com/2020/02/classification-of-element-and-periodic.html)
- `sample2.pdf`: Cplusplus.com – [C++ Language Tutorial](https://cplusplus.com/files/tutorial.pdf)

## Usage

To run OCR on the sample files, use the following command-line examples:

```bash
bocr sample1.jpg --save-outputs --export-format docx --verbose
```

Alternatively, you can run OCR in Python:

```python
from bocr import Config, ocr

config = Config(model_id="Qwen/Qwen2-VL-7B-Instruct", export_results=True, export_format="pdf", verbose=True)
files = ["sample1.jpg", "sample2.pdf"]
ocr(files, config)
```

## Notes

- Ensure that **bOCR** and its dependencies are properly installed before running the examples.
- For **PDF processing**, `poppler` must be installed and available in your system's `PATH`.
- Modify configurations as needed to test different OCR settings.

---

For more details, refer to the [bOCR README](../README.md).
