#!/bin/bash

# core
move check swap-core/src/modules/Libraries/UQ96x96.move  
move publish swap-core/src/modules/Libraries/UQ96x96.move 

move check swap-core/src/modules/Libraries/Account.move  
move publish swap-core/src/modules/Libraries/Account.move 

move check swap-core/src/modules/Libraries/Common.move
move publish swap-core/src/modules/Libraries/Common.move

move check swap-core/src/modules/Libraries/SafeMath.move
move publish swap-core/src/modules/Libraries/SafeMath.move

move check swap-core/src/modules/Fee.move
move publish swap-core/src/modules/Fee.move

move check swap-core/src/modules/LiquidityToken.move 
move publish swap-core/src/modules/LiquidityToken.move 

move check swap-core/src/modules/Pair.move  
move publish swap-core/src/modules/Pair.move  

move check swap-core/src/modules/Factory.move
move publish swap-core/src/modules/Factory.move
