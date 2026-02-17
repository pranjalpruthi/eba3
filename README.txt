Evolutionary Breakpoints Analyser (EBA) BASIC SETTINGS

Need at the current directory >>>

-chromosome Size (chr_size.txt) file
-taxdump dir
-project dir
-EBALib dir
-classification.eba file (optional)
-EBA.pl

--------------------------------------------------------------------------
Basic (mandatory) parameters >>>

perl EBA.pl -n <number_of_species> -d <project_directory> -r <reference_species> -p <prime_resolution> -t <threshold> -k

Example:
perl EBA.pl -n 5 -d data -r gallus_gallus -p 100 -t 20 -c classification.eba -k

---------------------------------------------------------------------------
For more help try perl EBA.pl -h

---------------------------------------------------------------------------
NOTE: The input HSB files should be in .txt format

File name should first contain the target species name (eg TargetName_ReferenceName*.txt) !!!!

----------------------------------------------------------------------------
IMPROVEMENT: 3.0

1. Improved overlap checking -- speed up: DONE
2. Separating the most common subs in other file: DONE
3. User can write comments in classification.eba file starting with # sign: DONE
4. Small EBRs "stats count file" in result folder ... can remove if needed: DONE
5. A bash script getTaxDB.sh in current directory to generate required taxonomy database: DONE
6. Change the name of EBA library from MyLib -> EBALib: DONE
7. The OS information is added, it checks for the OS and reports.
8. Added outfile option -o <outdir> ... (successful only if it is current directory, need to improve it in future) by default it creates a outdir EBA_OUT in current EBA.pl place: DONE
9. Added EBA3 WELCOME logo: DONE

----------------------------------------------------------------------------
LICENSE:
This tool is for Academic Use Only. Commercial use prohibited.

EBA Team
bioinformaticsonline.org / CSIR-IGIB
Bug-reports: jnlab.igib@gmail.com / mail@pranjal.work
