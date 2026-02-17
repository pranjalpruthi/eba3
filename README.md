# Evolutionary Breakpoints Analyser (EBA)

Evolutionary Breakpoints Analyser (EBA) is a tool for the precise detection of chromosomal breakpoint regions in assembled chromosome or genome sequences. Genomic rearrangement breakpoints regions are classified and assigned to phylogenetic nodes.

## Overview

The EBA algorithm detects chromosomal breakpoint regions by analyzing homologous synteny blocks (HSBs). These findings help in understanding the evolutionary history of genomic rearrangements across different species.

### Term Definitions

*   **Homologous Synteny Block (HSB):** Refers to two or more homologous markers (genes, sequences) that are syntenic in two or more species, have the same order, and are not interrupted by any other HSB.
*   **Evolutionary Breakpoint Region (EBR):** A region between two homologous synteny blocks that is demarcated by an evolutionary chromosome breakpoint boundary on each side.

## Case Study

EBA's capabilities have been demonstrated through studies involving 6 Mammalian and 6 Avian genome synteny block sets. A real-world experiment with cattle HSB data validated the tool's effectiveness in detecting and refining GAPs, reuse, and other breakpoints.

### Mammalian and Avian Analysis
EBA correctly detects EBRs and classifies them irrespective of the reference species and resolutions used, facilitating cross-species genomic comparisons.

## Installation & Setup

### Requirements
- **Perl >= 5.32.1**
- **Standard Perl modules** (included in most distributions; see `EBA.pl` for specific dependencies).
- **EBA3 Source Code:** `git clone https://github.com/pranjalpruthi/eba3.git`

### Required Project Files
For EBA to function correctly, ensure the following are present in your working directory:
- `EBA.pl` (Main script)
- `EBALib/` (Library directory)
- `chr_size.txt` (Chromosome size file)
- `taxdump/` (NCBI taxonomy database directory)
- `project_dir/` (Directory containing HSB files)
- `classification.eba` (Optional classification file)

## File Specifications

### Input HSB Files
- **Format:** Must be in tab-delimited `.txt` format.
- **Naming Convention:** Filenames should start with the target species name, following the pattern: `TargetName_ReferenceName*.txt` (e.g., `human_chicken_100.txt`).
- **Content:** Files should contain homologous synteny block data as specified in the manual.

## Usage

Basic parameters required to run EBA:
```bash
perl EBA.pl -n <number_of_species> -d <project_directory> -r <reference_species> -p <prime_resolution> -t <threshold> -k
```

### Mandatory Parameters
| Flag | Description |
| :--- | :--- |
| `-n` | Number of species you are analyzing. |
| `-d` | Directory containing the list of HSB files. |
| `-r` | Scientific name of your reference species (e.g., `gallus_gallus`). |
| `-p` | Primary resolution name (numeric value). |
| `-t` | Threshold value for reuse breakpoint filtration. |
| `-k` | Keep intermediate files (optional but recommended for verification). |

### Example
```bash
# Basic run
perl EBA.pl -n 5 -d data -r gallus_gallus -p 100 -t 20 -c classification.eba -k

# Advanced examples from usage.txt
perl EBA.pl -n 5 -d Rotifer_data2 -r Adineta_vaga -p 300 -t 20 -c classification.eba -k
```

For more help: `perl EBA.pl -h`

## What's New in v3.0

1.  **Performance:** Improved overlap checking for significantly faster processing.
2.  **Modularity:** Separated common subroutines into standalone files for better maintenance.
3.  **Flexibility:** Comments are now supported in `classification.eba` (starting with `#`).
4.  **Reporting:** New stats count file for small EBRs generated in the results folder.
5.  **Automation:** Included `getTaxDB.sh` to automatically generate the required taxonomy database.
6.  **Branding:** Standardized library name to `EBALib`.
7.  **Compatibility:** Added OS detection and reporting for cross-platform stability.
8.  **Output Management:** Improved `-o <outdir>` functionality for custom output locations.
9.  **Interface:** New EBA3 Welcome logo and enhanced CLI feedback.

## License

The EBA tool and supporting scripts are free for **Academic Use Only**. Commercial or paid use is strictly prohibited without prior written permission from the authors and Jitendra Lab.

## Contact

**EBA Team**
Affiliated with: [bioinformaticsonline.org](https://bioinformaticsonline.com) and CSIR-IGIB.
- **Authors:** Jitendra and Denis ([dmlarkin@gmail.com](mailto:dmlarkin@gmail.com))
- **Maintainer/Dev:** Pranjal Pruthi ([mail@pranjal.work](mailto:mail@pranjal.work))

Bug-reports: [jnlab.igib@gmail.com](mailto:jnlab.igib@gmail.com) / [mail@pranjal.work](mailto:mail@pranjal.work)