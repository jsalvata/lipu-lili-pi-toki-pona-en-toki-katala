# perl o-pala-e-lipu-lili.pl tokipona-cat.font > lipu-lili-toki-pona-toki-katala.html

print <<__E__;
<html>
<head>
  <link rel="stylesheet" href="linja-pona.css">
  <link rel="stylesheet" href="lipu-lili-toki-pona.css">
  <link rel="stylesheet" media="print" href="lipu-lili-toki-pona-lipu.css">
  <script>
    function oNasa(el) {
      document.querySelectorAll('.lipu-lili').forEach((lipuLili) => {
        lipuLili.style.order= el.checked ? Math.round(Math.random() * 10000) : 0;
      });
    }
  </script>
</head>
<body>
<input type="radio" name="lipu" id="sinpin" value="sinpin" checked> <label for="sinpin"><span class="linja-pona">sinpin: toki+pona</span> (sinpin: toki pona)</label>
<br/>
<input type="radio" name="lipu" id="monsi" value="monsi"> <label for="monsi"><span class="linja-pona">monsi: toki [_kalama_·_tan_·_lawa_· ]</span> (monsi: toki Katala)</label>
<br/>
<input type="checkbox" onClick="oNasa(this)" id="nasa"> <label for="nasa"><span class="linja-pona">o nasa e lipu lili</span> (o nasa e lipu lili)</label>
<div class="lipu">
__E__

@ala = <>;
$"="";
$ala = "@ala";
@ala = split /\n\n/, $ala;

foreach (@ala) {
  /:([^:]+): (?:-- )?(.*)/s or next;
  $toki = $1;
  @katala = split /\|/, $2;

  print <<"  __E__";
    <div class="lipu-lili">
      <div class="sinpin">
	<div class="linja-pona">$1</div>
	<div class="sitelen-lasino">$1</div>
      </div>
      <div class="monsi">
  __E__
  foreach (@katala) {
    /\[(\w+)\]\s+(.*)/s or next;
    print <<"    __E__";
        <div class="toki-katala"><i>[$1]</i> $2</div>
    __E__
  }
  print <<"  __E__";
      </div>
    </div>
  __E__
}


print <<__E__;
</div>
<i>Copyleft Jordi Salvat i Alabart</i> &mdash; <i class="linja-pona">jan [_jan_olin_sama_insa] li wile e ni: sina o mute e lipu ni kepeken wile sina</i>
</body>
</html>
__E__

