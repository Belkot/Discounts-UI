$(document).ready ->
  $("#checkoutpartial").html("<%= escape_javascript(render(partial: 'checkout', locals: {co: @co})) %>")
