# Approximate_Adders
This repo contains most of the approximate adders I've designed and tested during my Internship at National Institute of Technology, Delhi.
## Circuits in Verilog
### 1. Non-zero Truncation adder
This is an 8-bit adder with 4 bit accurate and 4 bit approximate part.
![Screenshot 2024-08-12 105759](https://github.com/user-attachments/assets/e1e0404e-1b4b-4cb6-9195-e10306b131dd)
The approximate result is obtained from the first (k) bits from lsb. The accurate part is till the (n-k)th bit from MSB to reduce error distace.

### 2. Error Reduced Carry Prediction Adder
![Screenshot 2024-08-12 150237](https://github.com/user-attachments/assets/b9418c88-c4c2-4d16-b083-d7ff055afca9)
The LSB (approximate) part has two circuits; Constant truncation part and Sum with reduced error scheme.
The circuit has a carry prediction technique, and the approximate bits are truncated whenever a carry is produced to reduce the error distance.

##Error analysis:
The repo contains the design code in verilog and testbench.
The testbench generates a textfile with a number of outputs. The error analysis can be done using simple python script, also attacehd in the repo.


### PS HERE'S THE LAYOUT DESIGN OF A MULTIPLIER CIRCUIT MADE USING ERROR REDUCED CARRY PREDICTION ADDER ;-]
![Screenshot 2024-08-12 152253](https://github.com/user-attachments/assets/63a97632-9f86-4ce9-a4b5-730dcd111f97)
*Note : I attached this only for fun and the repo doesn't have anything to generate the layout design. 
