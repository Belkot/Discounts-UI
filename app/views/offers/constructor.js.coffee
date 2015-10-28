$("#productspartial").html("<%= escape_javascript(render(partial: 'offers/constructor/products')) %>")
$("#rulebyonegetonefreepartial").html("<%= escape_javascript(render(partial: 'offers/constructor/rulesbyonegetonefree')) %>")
$("#rulediscountifonebymorepartial").html("<%= escape_javascript(render(partial: 'offers/constructor/rulesdiscountifonebymore')) %>")
