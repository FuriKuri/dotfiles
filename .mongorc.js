var host = db.serverStatus().host;
if (host === "coin-a-c-190.localdomain") {
	host = "🐳"; 
} else if (host === "naga.localdomain") {
	host = "🐠";
} else {
	host = "🐬";
}
var prompt = function() { return db+" at " + host + "  > "; }