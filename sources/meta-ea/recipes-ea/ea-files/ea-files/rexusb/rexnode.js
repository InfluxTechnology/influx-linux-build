const { spawn } = require('child_process'); 

//Initialize can0 speed 500kbs, RX ID: 0x7E8
child = spawn('./rexgen initcan 0 500000 0 0x7E8', [''], {shell: true}); 
child.stdout.on('data', (data) => { 
	const output = data;	
	console.log(output.toString());
});

//Send CAN Msg on can0 with DLC 8 and ID 0x7E0
child = spawn('./rexgen cansend 0 8 0x7E0 03 22 11 65 00 00 00 00', [''], {shell: true}); 
child.stdout.on('data', (data) => { 
	const output = data;	
	console.log(output.toString());
}); 

/*//Send CAN Msg periodically. Uncomment to use.
child = spawn('while :; do ./rexgen cansend 0 8 0x7E0 03 22 11 65 00 00 00 00; sleep 0.1; done', [''], {shell: true}); 
child.stdout.on('data', (data) => { 
	const output = data;	
	console.log(output.toString());
}); */


  
  child.stderr.on('data', (data) => { 
  console.error(`stderr: ${data}`); 
}); 
  
child.on('close', (code) => { 
  //console.log(`close`); 
}); 