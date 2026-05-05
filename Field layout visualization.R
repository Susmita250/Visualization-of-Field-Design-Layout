### Field layout Preparation
Research_data <- read.csv("sample_data.csv")

# 1. Update Entry numbers with "E-" prefix
# Using paste0 to combine the character 'E-' with the numeric entry + 9400
Research_data$Entry_Label <- paste0("E-", Research_data$Entry + 9400)

# 2. Clean data to numeric
Research_data$Col_n <- as.numeric(as.character(Research_data$Column))
Research_data$Row_n <- as.numeric(as.character(Research_data$Row))

# 3. X and Y Coordinates
Research_data$X_phys <- 38.0 - ((Research_data$Col_n * 2.0) - 1.0)
Research_data$Y_phys <- ifelse(Research_data$Row_n == 1, 3.0,
                               ifelse(Research_data$Row_n == 2, 5.5,
                                      ifelse(Research_data$Row_n == 3, 8.5, 
                                             ifelse(Research_data$Row_n == 4, 11.0, 0))))

# 4. Final Visualization
library(ggplot2)

ggplot(Research_data) +
  # DRAW THE OUTER FRAME (The boundary of the 38x12 field)
  geom_rect(aes(xmin = 0, xmax = 38, ymin = 0, ymax = 12), 
            fill = NA, color = "black", linewidth = 1) +
  
  # Draw the individual plots
  geom_rect(aes(xmin = X_phys - 2, xmax = X_phys, 
                ymin = Y_phys - 2, ymax = Y_phys, fill = factor(Rep)), 
            color = "black", linewidth = 0.3) +
  
  # Use the new Entry_Label (E-9401, etc.)
  geom_text(aes(x = X_phys - 1, y =  Y_phys - 1, label = Entry_Label), 
            size = 2.2, fontface = "bold") +
  
  # LABELS FOR THE GAPS
  annotate("text", x = 0.5, y = 6, label = "1m", angle = 90, size = 3) +
  annotate("text", x = 37.5, y = 6, label = "1m", angle = 90, size = 3) +
  annotate("text", x = 19, y = 0.5, label = "1.0m", size = 3) +
  annotate("text", x = 19, y = 11.5, label = "1.0m", size = 3) +
  annotate("text", x = 19, y = 3.25, label = "0.5m", size = 2.5) +
  annotate("text", x = 19, y = 6.0, label = "1.0m", size = 3) +
  annotate("text", x = 19, y = 8.75, label = "0.5m", size = 2.5) +
  
  # BLOCK LABELS
  annotate("text", x = -1.5, y = 2.5, label = "BLOCK 1", fontface = "bold", size = 2.5) +
  annotate("text", x = -1.5, y = 5.0, label = "BLOCK 2", fontface = "bold", size = 2.5) +
  annotate("text", x = -1.5, y = 8.0, label = "BLOCK 1", fontface = "bold", size = 2.5) +
  annotate("text", x = -1.5, y = 10.5, label = "BLOCK 2", fontface = "bold", size = 2.5) +
  
  # Format axes
  coord_fixed(xlim = c(-3, 39), ylim = c(-1, 13)) + 
  scale_fill_manual(values = c("#A6CEE3", "#B2DF8A"), name = "Replication") +
  theme_void() + 
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
    plot.subtitle = element_text(hjust = 0.5, size = 11),
    legend.position = "bottom",
    plot.margin = unit(c(0.5,0.5,0.5,0.5), "cm")
  ) +
  labs(
    title = "Wheat Experimental Field Layout",
    subtitle = "Total Area: 38m x 12m | 14SATYN-HEAT Entry Series: E-9400"
  )
