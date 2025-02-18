# Asenna tarvittava paketti, jos sitä ei ole vielä asennettu
if (!require(openxlsx)) install.packages("openxlsx", dependencies = TRUE)

# Lataa openxlsx-paketti
library(openxlsx)

# 1. Luodaan esimerkkidatasetti
data <- data.frame(
  ID = c(1, 2, 3, 4, 5),
  Name = c("Matti", "Liisa", "Pekka", "Anna", "Timo"),
  Age = c(30, 25, 40, 28, 35),
  Salary = c(4000, 3500, 5000, 3800, 4500)
)

# 2. Käsitellään data: lisätään Bonus-sarake ja suodatetaan yli 27-vuotiaat
data$Bonus <- data$Salary * 0.1
processed_data <- subset(data, Age > 27)

# 3. Tallennetaan Excel-tiedostoksi
output_path <- "/content/salaries_with_R.xlsx"  # Muuta tarvittaessa polkua, tässä tiedosto tallennetaan Colabin virtuaaliseen tiedostojärjestelmään
write.xlsx(processed_data, file = output_path, sheetName = "Salaries", rowNames = FALSE)

# Tulostetaan vahvistus
cat("Tiedosto tallennettu:", output_path, "\n")
