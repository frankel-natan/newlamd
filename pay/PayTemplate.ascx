<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PayTemplate.ascx.cs" Inherits="LamedNetLite.pay.PayTemplate" %>
<script>
    $(document).ready(function () {

        //For Card Number formatted input
        var cardNum = document.getElementById('cr_no');
        cardNum.onkeyup = function (e) {
            if (this.value == this.lastValue) return;
            var caretPosition = this.selectionStart;
            var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
            var parts = [];

            for (var i = 0, len = sanitizedValue.length; i < len; i += 4) { parts.push(sanitizedValue.substring(i, i + 4)); } for (var i = caretPosition - 1; i >= 0; i--) {
                var c = this.value[i];
                if (c < '0' || c > '9') {
                    caretPosition--;
                }
            }
            caretPosition += Math.floor(caretPosition / 4);

            this.value = this.lastValue = parts.join('-');
            this.selectionStart = this.selectionEnd = caretPosition;
        }

        //For Date formatted input
        var expDate = document.getElementById('exp');
        expDate.onkeyup = function (e) {
            if (this.value == this.lastValue) return;
            var caretPosition = this.selectionStart;
            var sanitizedValue = this.value.replace(/[^0-9]/gi, '');
            var parts = [];

            for (var i = 0, len = sanitizedValue.length; i < len; i += 2) { parts.push(sanitizedValue.substring(i, i + 2)); } for (var i = caretPosition - 1; i >= 0; i--) {
                var c = this.value[i];
                if (c < '0' || c > '9') {
                    caretPosition--;
                }
            }
            caretPosition += Math.floor(caretPosition / 2);

            this.value = this.lastValue = parts.join('/');
            this.selectionStart = this.selectionEnd = caretPosition;
        }

        // Radio button
        $('.radio-group .radio').click(function () {
            $(this).parent().find('.radio').removeClass('selected');
            $(this).addClass('selected');
        });

    });
    $('input[type=radio]').each(function () {//מאפשר לבחור רק אפשרות אחת ברדיו באטן
        var array = $(this).attr('name').split('$');
        $(this).attr('name', array[array.length - 1]);
    });
</script>
<style>
    * {
        margin: 0;
        padding: 0
    }

    html {
        height: 100%
    }



    .card0 {
        margin: 40px 12px 15px 12px;
        border: 0
    }

    .card1 {
        margin: 0;
        padding: 15px;
        padding-top: 25px;
        padding-bottom: 0px;
        background: #263238;
        height: 100%
    }

    .bill-head {
        color: #ffffff;
        font-weight: bold;
        margin-bottom: 0px;
        margin-top: 0px;
        font-size: 30px
    }

    .line {
        border-right: 1px grey solid
    }

    .bill-date {
        color: #BDBDBD
    }

    .red-bg {
        margin-top: 25px;
        margin-left: 0px;
        margin-right: 0px;
        background-color: #F44336;
        padding-left: 20px !important;
        padding: 25px 10px 25px 15px
    }

    #total {
        margin-top: 0px;
        padding-left: 7px
    }

    #total-label {
        margin-bottom: 0px;
        color: #ffffff;
        padding-left: 7px
    }

    #heading1 {
        color: #ffffff;
        font-size: 20px;
        padding-left: 10px
    }

    #heading2 {
        font-size: 27px;
        color: #D50000
    }

    .placeicon {
        font-family: fontawesome !important
    }

    .card2 {
        padding: 25px;
        margin: 0;
        height: 100%
    }

    .form-card .pay {
        font-weight: bold
    }

    .form-card input,
    .form-card textarea {
        padding: 10px 8px 10px 8px;
        border: none;
        border: 1px solid lightgrey;
        border-radius: 0px;
        margin-bottom: 25px;
        margin-top: 2px;
        width: 100%;
        box-sizing: border-box;
        font-family: montserrat;
        color: #2C3E50;
        font-size: 14px;
        letter-spacing: 1px
    }

        .form-card input:focus,
        .form-card textarea:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            border: none;
            font-weight: bold;
            border: 1px solid gray;
            outline-width: 0
        }

    .btn-info {
        color: #ffffff !important
    }

    .radio-group {
        position: relative;
        margin-bottom: 25px
    }

    .radio {
        display: inline-block;
        width: 204;
        height: 64;
        border-radius: 0;
        background: lightblue;
        box-sizing: border-box;
        border: 2px solid lightgrey;
        cursor: pointer;
        margin: 8px 25px 8px 0px
    }

        .radio:hover {
            box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.2)
        }

        .radio.selected {
            box-shadow: 0px 0px 0px 1px rgba(0, 0, 0, 0.4)
        }

    .fit-image {
        width: 100%;
        object-fit: cover
    }
</style>
<form runat="server">
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-12 col-lg-11">
                <div class="card card0 rounded-0">
                    <div class="row">

                        <div class="col-md-7 col-sm-12 p-0 box">
                            <div class="card rounded-0 border-0 card2" id="paypage">
                                <div class="form-card">
                                    <h2 id="heading2" class="text-danger">אפשרויות תשלום</h2>
                                    <div class="radio-group">
                                        <div class='radio' data-value="credit">
                                            <img src="https://i.imgur.com/28akQFX.jpg" width="200px" height="60px">
                                        </div>
                                        <div class='radio' data-value="paypal">
                                            <img src="https://i.imgur.com/5QFsx7K.jpg" width="200px" height="60px">
                                        </div>
                                        <br>
                                    </div>
                                    <label class="pay">שם בעל הכרטיס</label>
                                    <input type="text" name="holdername" placeholder="John Smith">
                                    <div class="row">
                                        <div class="col-8 col-md-6">
                                            <label class="pay">מספר כרטיס</label>
                                            <input type="text" name="cardno" id="cr_no" placeholder="0000-0000-0000-0000" minlength="19" maxlength="19">
                                        </div>
                                        <div class="col-4 col-md-6">
                                            <label class="pay">CVV</label>
                                            <input type="password" name="cvcpwd" placeholder="&#9679;&#9679;&#9679;" class="placeicon" minlength="3" maxlength="3">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <label class="pay">תוקף</label>
                                        </div>
                                        <div class="col-md-12">
                                            <input type="text" name="exp" id="exp" placeholder="MM/YY" minlength="5" maxlength="5">
                                        </div>
                                    </div>
                                </div>
                                <h6>סוג תשלום</h6>
                                <div style="width:max-content;" runat="server" id="PaymentOptins" visible="false">
                                    <select class="form-control">
                                        <option>רגיל</option>
                                        <asp:Repeater runat="server" ID="rptPaymentOptins">
                                            <ItemTemplate>
                                                <option>
                                                    <%# Container.DataItem?.ToString() ?? string.Empty%>
                                                    תשלומים
                                                </option>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </select>
                                    <input type="hidden" runat="server" id="SelectedPaymentOptin" />
                                </div>
                                <br />
                                <div class="row">
                                    <div class="col-md-6">

                                        <input type="submit" style="width: 100%;" value="אישור וביצוע התשלום" class="btn btn-info placeicon">
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>




</form>
