```C++
function void draw(int location) {
	var int memAddress; 
	let memAddress = 16384+location;
	// column 0
	do Memory.poke(memAddress, 0);
	do Memory.poke(memAddress +32, 0);
	do Memory.poke(memAddress +64, 0);
	do Memory.poke(memAddress +96, 0);
	do Memory.poke(memAddress +128, -8192);
	do Memory.poke(memAddress +160, 6144);
	do Memory.poke(memAddress +192, 1024);
	do Memory.poke(memAddress +224, 1024);
	do Memory.poke(memAddress +256, 512);
	do Memory.poke(memAddress +288, 29184);
	do Memory.poke(memAddress +320, 29184);
	do Memory.poke(memAddress +352, 29184);
	do Memory.poke(memAddress +384, 1024);
	do Memory.poke(memAddress +416, 5632);
	do Memory.poke(memAddress +448, -3584);
	do Memory.poke(memAddress +480, -24064);
	do Memory.poke(memAddress +512, -13312);
	do Memory.poke(memAddress +544, 12288);
	do Memory.poke(memAddress +576, -16384);
	do Memory.poke(memAddress +608, 0);
	do Memory.poke(memAddress +640, 0);
	do Memory.poke(memAddress +672, 0);
	do Memory.poke(memAddress +704, 0);
	do Memory.poke(memAddress +736, 0);
	do Memory.poke(memAddress +768, 0);
	do Memory.poke(memAddress +800, 0);
	do Memory.poke(memAddress +832, 0);
	do Memory.poke(memAddress +864, 0);
	do Memory.poke(memAddress +896, 0);
	do Memory.poke(memAddress +928, 0);
	do Memory.poke(memAddress +960, 0);
	do Memory.poke(memAddress +992, 0);
	// column 1
	do Memory.poke(memAddress +1, 0);
	do Memory.poke(memAddress +33, 0);
	do Memory.poke(memAddress +65, 0);
	do Memory.poke(memAddress +97, 0);
	do Memory.poke(memAddress +129, 63);
	do Memory.poke(memAddress +161, 192);
	do Memory.poke(memAddress +193, 256);
	do Memory.poke(memAddress +225, 256);
	do Memory.poke(memAddress +257, 512);
	do Memory.poke(memAddress +289, 624);
	do Memory.poke(memAddress +321, 592);
	do Memory.poke(memAddress +353, 626);
	do Memory.poke(memAddress +385, 263);
	do Memory.poke(memAddress +417, 832);
	do Memory.poke(memAddress +449, 639);
	do Memory.poke(memAddress +481, 554);
	do Memory.poke(memAddress +513, 415);
	do Memory.poke(memAddress +545, 96);
	do Memory.poke(memAddress +577, 31);
	do Memory.poke(memAddress +609, 0);
	do Memory.poke(memAddress +641, 0);
	do Memory.poke(memAddress +673, 0);
	do Memory.poke(memAddress +705, 0);
	do Memory.poke(memAddress +737, 0);
	do Memory.poke(memAddress +769, 0);
	do Memory.poke(memAddress +801, 0);
	do Memory.poke(memAddress +833, 0);
	do Memory.poke(memAddress +865, 0);
	do Memory.poke(memAddress +897, 0);
	do Memory.poke(memAddress +929, 0);
	do Memory.poke(memAddress +961, 0);
	do Memory.poke(memAddress +993, 0);
	// column 2
	do Memory.poke(memAddress +2, 0);
	do Memory.poke(memAddress +34, 0);
	do Memory.poke(memAddress +66, 0);
	do Memory.poke(memAddress +98, 0);
	do Memory.poke(memAddress +130, 0);
	do Memory.poke(memAddress +162, 0);
	do Memory.poke(memAddress +194, 0);
	do Memory.poke(memAddress +226, 0);
	do Memory.poke(memAddress +258, 0);
	do Memory.poke(memAddress +290, 0);
	do Memory.poke(memAddress +322, 0);
	do Memory.poke(memAddress +354, 0);
	do Memory.poke(memAddress +386, 0);
	do Memory.poke(memAddress +418, 0);
	do Memory.poke(memAddress +450, 0);
	do Memory.poke(memAddress +482, 0);
	do Memory.poke(memAddress +514, 0);
	do Memory.poke(memAddress +546, 0);
	do Memory.poke(memAddress +578, 0);
	do Memory.poke(memAddress +610, 0);
	do Memory.poke(memAddress +642, 0);
	do Memory.poke(memAddress +674, 0);
	do Memory.poke(memAddress +706, 0);
	do Memory.poke(memAddress +738, 0);
	do Memory.poke(memAddress +770, 0);
	do Memory.poke(memAddress +802, 0);
	do Memory.poke(memAddress +834, 0);
	do Memory.poke(memAddress +866, 0);
	do Memory.poke(memAddress +898, 0);
	do Memory.poke(memAddress +930, 0);
	do Memory.poke(memAddress +962, 0);
	do Memory.poke(memAddress +994, 0);
	return;
}
```