$(document).ready(function () {
       $('tr').click(function () {
            var tr = this;
            var tds = tr.getElementsByTagName('td');
            //var span = tr.getElementsByClassName('footer_nav');
            

            if ((tds != null) && (tds.length > 0) ) {
                var td = tds[0];
                var id = td.innerHTML;
                

                var tableId = tr.parentNode.parentNode.id;
                tableId = tableId.replace("FeaturedContent_", "");

                var editUrl = 'Edit/' + 'Edit' + tableId + '.aspx?id=' + id;
                var editLinkName = 'Edit' + tableId;
                var editLink = document.getElementById(editLinkName);

                if (id.search(/^(?!<$)(?!>$)([0-9a-z]{8}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{12})$/) == 0) {
                    editLink.setAttribute('href', editUrl);

                    var links = document.getElementsByClassName("dynalink");

                    for (var I = 0; I < links.length; I++) {
                        var url = links[I].id + '.aspx?PK=' + id;
                        links[I].setAttribute('href', url);
                    }
                    showSideMenu(tableId + '_tablemenu');
                }
                
                
            }
        });
    });