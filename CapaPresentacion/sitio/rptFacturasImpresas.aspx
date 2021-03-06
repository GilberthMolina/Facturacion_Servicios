﻿<%@ Page Title="Facturas Impresas" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPage/ServiciosABCCliente.Master" CodeBehind="rptFacturasImpresas.aspx.vb" Inherits="CapaPresentacion.rptFacturasImpresas" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="contentHeader" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="contentPage" runat="server">
    <div class="container">
        <br />
        <div class="row">
            <div class="col-xs-12">
			    <div class="panel panel-default">
				    <div class="panel-body">
					    <fieldset>
						    <legend class="text-center">Reporte: Facturas Impresas</legend>
						    <div class="col-xs-12">
                                <div class="table-responsive">
                                    <table class="table table-bordered table-condensed table-hover">
                                        <thead>
                                            <tr>
                                                <th colspan="3" class="text-center headerText-table">Par&aacute;metros de entrada</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="text-center">
                                                <td>
                                                    <label for="txtFechaInicio" class="control-label alineadoFechaInicioFin text-right">Fecha inicio:</label>
                                                    <asp:TextBox ID="TB_FechIni" runat="server"></asp:TextBox>&nbsp;
                                                </td>
                                                <td>
                                                    <label for="txtFechaFin" class="control-label alineadoFechaInicioFin text-right">Fecha fin:</label>
                                                    <asp:TextBox ID="TB_FechFin" runat="server"></asp:TextBox>&nbsp;
                                                </td>
                                                <td class="col-xs-1 col-sm-1 col-md-1 text-center">
                                                    <asp:Button ID="BT_Generar" runat="server" Text="Generar" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
					        </div>
					        <br />
					        <div class="row">
						        <div class="col-xs-12 text-right">
							        <!-- Aqui va el reporte -->
						            <rsweb:ReportViewer ID="ReporteFacturas" runat="server" Width="772px" 
                                        Font-Names="Verdana" Font-Size="8pt" InteractiveDeviceInfos="(Collection)" 
                                        WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Height="622px">
                                        <LocalReport ReportPath="includes\Reportes\ReporteFacturas.rdlc">
                                            <DataSources>
                                                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" 
                                                    Name="DataSetFacturas" />
                                            </DataSources>
                                        </LocalReport>
                                    </rsweb:ReportViewer>
						            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                                        OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                                        TypeName="CapaPresentacion.DataSetFacturasTableAdapters.SP_Reporte_FacturasTableAdapter">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="PK_Correo" SessionField="vCorreoElectronico" 
                                                Type="String" />
                                        </SelectParameters>
                                    </asp:ObjectDataSource>
						        </div>
					        </div>
                        </fieldset>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="contentFooter" runat="server"></asp:Content>
