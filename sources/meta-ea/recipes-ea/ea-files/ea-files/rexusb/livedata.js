const { spawn } = require('child_process'); 

//Read Live data: Accelerometer, Gyro and CAN
child = spawn('./rexgen livedata', [''], {shell: true}); 
child.stdout.on('data', (data) => { 
	const output = data;	
	console.log(output.toString());
});
  
child.on('close', (code) => { 
  //console.log(`close`); 
}); 