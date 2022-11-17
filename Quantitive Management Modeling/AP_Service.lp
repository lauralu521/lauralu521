/* Objective function */
min: 775 X1 + 750 X2 + 775  X3 + 800 X4 + 800 X5 + 800 X6 + 800 X7;

/* Constraints */
X1 + X4 + X5 + X6 + X7 >= 18;
X1 + X2 + X5 + X6 + X7 >= 27;
X1 + X2 + X3 + X6 + X7 >= 22;
X1 + X2 + X3 + X4 + X7 >= 26;
X1 + X2 + X3 + X4 + X5 >= 25;
X2 + X3 + X4 + X5 + X6 >= 21;
X3 + X4 + X5 + X6 + X7 >= 19;

int  X1, X2, X3, X4, X5, X6, X7;



