/* 1. Luodaan esimerkkidatasetti */
data exampledata;
    input ID Name $ Age Salary;
    datalines;
    1 Matti 30 4000
    2 Liisa 25 3500
    3 Pekka 40 5000
    4 Anna 28 3800
    5 Timo 35 4500
    ;
run;

/* 2. Käsittele dataa: lisää uusi muuttuja ja suodata */
data processed_data;
    set exampledata;
    Bonus = Salary * 0.1; /* Lisää bonus 10 % palkasta */
    if Age > 27; /* Suodata: vain yli 27-vuotiaat henkilöt */
run;

/* 3. Vie tulos Exceliin */
proc export data=processed_data
    outfile="C:\Temp\output.xlsx" /* Sijainti, jonne excel-tiedosto tallennetaan */
    dbms=xlsx replace;
    sheet="Salaries";
run;
