/**
 * 
 */
	
let magicNumber= Math.floor(Math.random()*(100-1+1))+1;

let buonoindex;

let buoni = new Array(20);
	buoni[0]="CocoCutie20%";
	buoni[1]="RetroMania15";
	buoni[2]="GemsMaster10";
	buoni[3]="RingSpeed25%";
	buoni[4]="NesLovers10%";
	buoni[5]="NintendKid20";
	buoni[6]="PlayForYou17";
	buoni[7]="MegaSales35%";
	buoni[8]="CrateSales34";
	buoni[9]="LeonLeonre40";
	buoni[10]="MLSPMCAPZZ89";
	buoni[11]="Democracy12%";
	buoni[12]="PortalSale29";
	buoni[13]="XboxGamers33";
	buoni[14]="MyPetition20";
	buoni[15]="SimsControl7";
	buoni[16]="LovelyZelda8";
	buoni[17]="KratosGodW55";
	buoni[18]="IsabelleCr36";
	buoni[19]="BomboKleet49";
	
	
function giochino(){
    var output = document.getElementById('output');
    var outputbuono = document.getElementById('buono');
    var user = document.getElementById('inputGiocatore').value;

    if(user > magicNumber){
        output.innerHTML = "Il numero è più piccolo";
    }
    else if(user < magicNumber){
        output.innerHTML = "Il numero è più grande";
    }else{
        var buonoindex = Math.floor(Math.random()*(19-0+1))+0;
        output.innerHTML = "Complimenti hai Vinto un Buono Sconto!";
        outputbuono.innerHTML = buoni[buonoindex];
        document.getElementById('inviaRisposta').style.display = 'none';
        document.getElementById('ricomincia').style.display = 'block';
        document.getElementById('ricomincia').style.visibility = 'visible'; 
    }
    magicNumber= Math.floor(Math.random()*(100-1+1))+1;
}

function ricomincia(){
    document.getElementById('inputGiocatore').value = "";
    document.getElementById('output').innerHTML = "";
    document.getElementById('buono').innerHTML = "";
    document.getElementById('inviaRisposta').style.display = 'block';
    document.getElementById('ricomincia').style.display = 'none';
}