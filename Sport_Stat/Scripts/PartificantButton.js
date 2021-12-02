function PartificantClickButton() {
    var params = window.location.search.replace('?', '').split('&').reduce(
        function (p, e) {
            var a = e.split('=');
            p[decodeURIComponent(a[0])] = decodeURIComponent(a[1]);
            return p;
        },
        {}
        );

    var urlsite = 'Participant';
    var id = params['PK'];
    
    if (id.search(/^(?!<$)(?!>$)([0-9a-z]{8}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{12})$/) == 0) {
        location.href = '/Add/Add/Participant.aspx?PK=' + id;
        
    }
}