<?php

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, "http://bbbvz.uvanet.br/demo/demo4_helper.jsp");
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
$retorno=curl_exec($ch);

#$tmp = substr($retorno, strpos($retorno, "participantCount>") + 17);
#$num = substr($tmp, 0, strpos($tmp, "</participantCount"));
#echo $num;


$dom = new DOMDocument;
$dom->loadXML($retorno);
$elements = $dom->getElementsByTagName('participantCount');
foreach ($elements as $element) {
	    echo $element->nodeValue, PHP_EOL;
}

?>
