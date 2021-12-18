# perl generar-cartes.pl  tokipona-cat.font > lipu-lili-toki-pona-katala.html

print <<__E__;
<html>
<head>
  <link rel="stylesheet" href="https://davidar.github.io/linja-pona/stylesheet.css">
  <link rel="stylesheet" href="lipu-lili-toki-pona.css">
  <link rel="stylesheet" media="print" href="lipu-lili-toki-pona-lipu.css">
</head>
<body>
<input type="radio" name="lipu" id="sinpin" value="sinpin" checked> <label for="sinpin"><span class="linja-pona">sinpin: toki+pona</span> (sinpin: toki pona)</label>
<br/>
<input type="radio" name="lipu" id="monsi" value="monsi"> <label for="monsi"><span class="linja-pona">monsi: [_kalama_ali_tan_anpa_loje_ante]</span> (monsi: Katala)</label>
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
<i>Copyleft Jordi Salvat i Alabart</i> &mdash; <i class="linja-pona">jan [_jan_olin_taso_insa] li wile e sina pala tu tawa pona</i>
</body>
</html>
__E__

