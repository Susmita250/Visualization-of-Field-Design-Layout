🌾 Wheat Field Layout Visualization & Spatial Mapping in R

📖 Project Overview

This repository contains a specialized R-based workflow for the spatial visualization and physical mapping of experimental field trials. Developed during research on wheat in AFU under late-sown terminal heat-stress conditions, this tool automates the transition from experimental design spreadsheets to field-ready physical maps.

The script is particularly optimized for evaluating elite wheat genotypes (such as the 14SATYN-HEAT series) under terminal heat stress conditions, ensuring precise plot identification and trial management.

✨ Key Features

🏷️ Dynamic Labeling: Automatically generates standardized entry labels (e.g., E-9401) by merging numeric IDs with specific series prefixes.

🗺️ Coordinate Transformation: Translates Row, Column, and Replication indices into exact meter-based X/Y coordinates for a 38m x 12m field.

📐 Precise Spatial Modeling: Includes specific code logic for:

1.0m outer perimeter borders.

0.5m and 1.0m internal alleyways for irrigation access and phenotypic observation.

🎨 Replication Shading: Uses ggplot2 to visually distinguish between replications, assisting in Alpha Lattice Design verification


💻Technical Stack

Language: R

Core Libraries: ggplot2

Methodology: Geometrical mapping using geom_rect() for physical plot boundaries and annotate() for spatial dimensions.

📂Repository Structure

Field_layout_visualization.R: The primary R script containing data cleaning and visualization logic.

Field layout output.png: A high-resolution output of the generated field map.

LICENSE: MIT License (Open Research compliant).

🖼️Visual Output

Below is the generated layout for the 14SATYN-HEAT nursery:
<img width="942" height="477" alt="Field layout output" src="https://github.com/user-attachments/assets/afda7be0-e64d-454e-b5e8-7146e9e86915" />

🔬Research Context

This tool was utilized for field evaluations of 36 wheat genotypes under late-sown conditions. The primary objective of the layout was to facilitate precise data collection for agro-morphological traits by maintaining standardized spacing between genotypes and replications.

🚀How to Use

1. Prepare Data: Ensure your dataset (e.g., Research_data) includes the following columns: Entry, Row, Column, and Rep.

2. Set Dimensions: The script is currently calibrated for a 38x12m field. Adjust the X_phys and Y_phys logic if your field dimensions differ.

3. Execute: Run the script in RStudio to generate the interactive and static field maps.

📧Contact & Citation

If you use this workflow in your research or wish to discuss PhD collaborations in plant breeding and computational multiomics, feel free to reach out.

Author: Susmita Shrestha

📍Field Site: Rampur, Chitwan, Nepal

🎓Focus: Plant Breeding | Terminal heat stress phenotyping | R for Agriculture
