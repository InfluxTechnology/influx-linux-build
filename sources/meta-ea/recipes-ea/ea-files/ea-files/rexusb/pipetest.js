process.stdin.resume();
process.stdin.on('data', function(chunk) {
 console.log('D', ''+chunk);
});