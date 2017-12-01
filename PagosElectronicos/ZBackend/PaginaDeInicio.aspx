﻿<%@ Page Title="" Language="C#" MasterPageFile="~/ZBackend/Backend.master" AutoEventWireup="true" CodeFile="PaginaDeInicio.aspx.cs" Inherits="ZBackend_PaginaDeInicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h1>BIENVENIDO A PAGOS ONLINE</h1>
    <link href="../css/style.css" rel="stylesheet" />


    <div style="margin-top:-100px;">
        <div class="content" style="height: 700px;">

            <ul id="sdt_menu" class="sdt_menu">

                <asp:Repeater runat="server" DataSourceID="odsCategoria">
                    <ItemTemplate>


                        <li style="margin-top: 150px;">
                            <a href="#">

                                <asp:HyperLink CssClass="mdl-button mdl-js-button mdl-button--icon" runat="server" NavigateUrl='<%# "~/ZBackend/VerCursos.aspx?hdnCategoriaNombre=" + Eval("Id")%>'><asp:Image Width="60px" Height="60px" ImageUrl='<%#  "~/img/categoria/" + Eval("UnaCategoriaSeleccionada.Nombre")+".jpg" %>' runat="server" /></asp:HyperLink>
                                <span class="sdt_active"></span>
                                <span class="sdt_wrap">
                                    <span class="sdt_link"><%# Eval("nombre")%></span>
                                    <span class="sdt_descr">Oferta Presencial</span>
                                </span>


                            </a>
                            <div class="sdt_box">
                                <a href="#">Ver Cursos </a>
                                <a href="#">Ver Docentes </a>
                                <a href="#">Modelos de cursos</a>
                            </div>
                        </li>

                    </ItemTemplate>
                </asp:Repeater>

                <asp:ObjectDataSource runat="server" ID="odsCategoria" SelectMethod="SelectAll" TypeName="CategoriaBLL"></asp:ObjectDataSource>






            </ul>
        </div>


    </div>

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>

    <script src="Scripts/jquery.easing.1.3.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            /**
            * for each menu element, on mouseenter, 
            * we enlarge the image, and show both sdt_active span and 
            * sdt_wrap span. If the element has a sub menu (sdt_box),
            * then we slide it - if the element is the last one in the menu
            * we slide it to the left, otherwise to the right
            */
            $('#sdt_menu > li').bind('mouseenter', function () {
                var $elem = $(this);
                $elem.find('img')
                    .stop(true)
                    .animate({
                        'width': '170px',
                        'height': '170px',
                        'left': '0px'
                    }, 400, 'easeOutBack')
                    .andSelf()
                    .find('.sdt_wrap')
                    .stop(true)
                    .animate({ 'top': '140px' }, 500, 'easeOutBack')
                    .andSelf()
                    .find('.sdt_active')
                    .stop(true)
                    .animate({ 'height': '170px' }, 300, function () {
                        var $sub_menu = $elem.find('.sdt_box');
                        if ($sub_menu.length) {
                            var left = '170px';
                            if ($elem.parent().children().length == $elem.index() + 1)
                                left = '-170px';
                            $sub_menu.show().animate({ 'left': left }, 200);
                        }
                    });
            }).bind('mouseleave', function () {
                var $elem = $(this);
                var $sub_menu = $elem.find('.sdt_box');
                if ($sub_menu.length)
                    $sub_menu.hide().css('left', '0px');

                $elem.find('.sdt_active')
                    .stop(true)
                    .animate({ 'height': '0px' }, 300)
                    .andSelf().find('img')
                    .stop(true)
                    .animate({
                        'width': '0px',
                        'height': '0px',
                        'left': '85px'
                    }, 400)
                    .andSelf()
                    .find('.sdt_wrap')
                    .stop(true)
                    .animate({ 'top': '25px' }, 500);
            });
        });
    </script>







</asp:Content>

