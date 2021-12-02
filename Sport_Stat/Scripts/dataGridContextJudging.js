function radiobuttonchecked(ctrl) {
    var text = document.getElementById('text');
    if (ctrl.id == 'rbtn1') {
        text.value = "";
        text.removeAttribute('disabled', 'disabled');
    }
    else {
        text.setAttribute('disabled', 'disabled')
        text.value = "";
    }
    if (ctrl.id == 'rbtn2') {
        text.value = "B";
    }
    if (ctrl.id == 'rbtn3') {
        text.value = "N";
    }

    

}

$(document).ready(function () {
    $('tr').click(function () {
        var tr = this;
        var tds = tr.getElementsByTagName('td');

        user = document.getElementById('FeaturedContent_txt_refereeid').value;


        if ((tds != null) && (tds.length > 0)) {
            var td = tds[0];
            var id = td.innerHTML;

            var tableId = tr.parentNode.parentNode.id;
            tableId = tableId.replace("FeaturedContent_", "");
           

            if (id.search(/^(?!<$)(?!>$)([0-9a-z]{8}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{4}[-]{1}[0-9a-z]{12})$/) == 0) {
                function showCover() {
                    var coverDiv = document.createElement('div');
                    coverDiv.id = 'cover-div';
                    document.body.appendChild(coverDiv);
                }

                function hideCover() {
                    document.body.removeChild(document.getElementById('cover-div'));
                }

                function showPrompt(text, callback) {
                    showCover();
                    var form = document.getElementById('prompt-form');
                    var container = document.getElementById('prompt-form-container');
                    document.getElementById('prompt-message').innerHTML = text;
                    form.elements.text.value = '';

                    function complete(value) {
                        hideCover();
                        container.style.display = 'none';
                        document.onkeydown = null;
                        callback(value);
                    }

                    form.onsubmit = function () {
                        var value = form.elements.text.value;
                        if (value == '') return false; // игнорировать пустой submit
                        
                        complete(value);


                        $.ajax({
                            type: "POST",
                            cache: false,   //параметр запрета кэширования нужно установить
                            async: true,
                            url: "HandlerEGV.ashx", //Handler(папка)/MyHandler.ashx(файл)
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            data: { 'Id': id, 'tst': value, 'User': user }, //Данные, передаваемые на серверную сторону
                            responseType: "json",
                            success: function (data, textStatus, XHR) //
                            {
                                //Отображаем принятые данные
                                alert(' Оценка  ' + value + '  успешно занеслась ');
                                location.reload();

                            },
                            error: function () //
                            {
                                alert("Status Error");
                                return false;
                            }
                        })


                        return false;

                    };

                    form.elements.cancel.onclick = function () {
                        complete(null);
                    };

                    document.onkeydown = function (e) {
                        if (e.keyCode == 27) { // escape
                            complete(null);
                        }
                    };

                    var lastElem = form.elements[form.elements.length - 1];
                    var firstElem = form.elements[0];

                    lastElem.onkeydown = function (e) {
                        if (e.keyCode == 9 && !e.shiftKey) {
                            firstElem.focus();
                            return false;
                        }
                    };

                    firstElem.onkeydown = function (e) {
                        if (e.keyCode == 9 && e.shiftKey) {
                            lastElem.focus();
                            return false;
                        }
                    };


                    container.style.display = 'block';
                    form.elements.text.focus();
                }

                showPrompt("Введите результат: ", function (value) {});

            }




        }
    });
});