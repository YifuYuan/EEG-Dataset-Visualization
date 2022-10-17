epochs = readvars('1_1.xlsx','Sheet','Sheet2','Range','A1:A200');
stages = readvars('1_1.xlsx','Sheet','Sheet2','Range','B1:B200');
MT = [transpose(1:200), stages];

plot(stages);