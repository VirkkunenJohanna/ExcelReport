import pandas as pd

# 1. Luodaan esimerkkidatasetti
data = {
    "ID": [1, 2, 3, 4, 5],
    "Name": ["Matti", "Liisa", "Pekka", "Anna", "Timo"],
    "Age": [30, 25, 40, 28, 35],
    "Salary": [4000, 3500, 5000, 3800, 4500]
}

df = pd.DataFrame(data)

# 2. Käsitellään data: lisätään Bonus-sarake ja suodatetaan yli 27-vuotiaat
df["Bonus"] = df["Salary"] * 0.1
processed_df = df[df["Age"] > 27]

# 3. Tallennetaan Excel-tiedostoksi
output_path = r"C:\Dev\Palkat\salaries.xlsx"  # Muuta tarvittaessa polkua
processed_df.to_excel(output_path, sheet_name="Salaries", index=False)

print(f"Tiedosto tallennettu: {output_path}")
