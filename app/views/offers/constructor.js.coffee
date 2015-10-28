$(document).ready ->
  $("#productspartial").html("<%= escape_javascript(render(partial: 'offers/constructor/products')) %>")
