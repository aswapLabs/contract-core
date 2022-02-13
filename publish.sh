#!/bin/bash

# test
move check src/modules/Tokens/Token1.move
move publish src/modules/Tokens/Token1.move

move check src/modules/Tokens/Token2.move
move publish src/modules/Tokens/Token2.move

#move check src/modules/Tokens/Token3.move
#move publish src/modules/Tokens/Token3.move


# core
move check src/modules/Libraries/UQ96x96.move  
move publish src/modules/Libraries/UQ96x96.move 

move check src/modules/Libraries/Account.move  
move publish src/modules/Libraries/Account.move 

move check src/modules/Libraries/Common.move
move publish src/modules/Libraries/Common.move

move check src/modules/Libraries/SafeMath.move
move publish src/modules/Libraries/SafeMath.move

move check src/modules/Fee.move
move publish src/modules/Fee.move


move check src/modules/LiquidityToken.move 
move publish src/modules/LiquidityToken.move 

move check src/modules/Pair.move  
move publish src/modules/Pair.move  

move check src/modules/Factory.move
move publish src/modules/Factory.move
