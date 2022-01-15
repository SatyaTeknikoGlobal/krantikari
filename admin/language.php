<?php 
function ip_details($ip) {
    $json = file_get_contents("http://ipinfo.io/{$ip}");
    $details = json_decode($json);
    return $details;
}



 $ip = $_SERVER['REMOTE_ADDR']; 
// $ip = '1.0.32.0';

 echo $ip;

$details = ip_details($ip);

//$country = strtolower($details->country);  
$country = 'hi';  



?>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<div id="google_translate_element"></div><script>
    function googleTranslateElementInit() {

        $.getJSON("https://justmyip.org/api",function(result){

            console.dir(result);
            country_code = result.geo.country_code.toLowerCase();

            new google.translate.TranslateElement({
                pageLanguage: '<?php echo $country;?>'



            }, 'google_translate_element');

        });
    }

</script>
<script src="https://translate.google.com/translate_a/element.js?cb=googleTranslateElementInit">

</script>

<script crossorigin="anonymous" src="https://cdn.amcapi.com/translation/cloudtranslation-1.0.0.min.js"></script>
<script type="application/json" id="CloudTranslationConfig">
    {
  "Settings": {
    "DefaultLanguage": "en",
    "TranslatorProvider": "Azure", // Could be empty if you want to provide the translations manually
    "TranslatorProviderKey": "{Your Microsoft Azure Translator Key}",
    "UrlLanguageLocation": "Subdirectory"
  },
  "Languages": [
    {
      "Code": "en",
      "DisplayName": "English"
    },
    {
      "Code": "de",
      "DisplayName": "Deutsch"
    }
  ]
}
</script>





<p>Satya</p>
