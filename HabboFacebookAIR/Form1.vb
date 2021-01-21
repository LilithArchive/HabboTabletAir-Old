Imports System.ComponentModel
Imports System.Net
Imports Titanium.Web.Proxy
Imports Titanium.Web.Proxy.EventArguments
Imports Titanium.Web.Proxy.Models

Public Class Form1
    Public WithEvents ProxyHB As New ProxyServer(True, False, False)
    Public ValidAuthentication As Boolean = False
    Public Authentication As String = ""
    Public Cookies As String = ""

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            Dim explicitEndPoint = New ExplicitProxyEndPoint(IPAddress.Any, 666, True)
            ProxyHB.AddEndPoint(explicitEndPoint)
            ProxyHB.Start()
            ProxyHB.SetAsSystemHttpProxy(explicitEndPoint)
            ProxyHB.SetAsSystemHttpsProxy(explicitEndPoint)
            If ProxyHB.CertificateManager.RootCertificate.Verify = False Then
                MsgBox("You must accept the certificate.", MsgBoxStyle.Critical, "Error")
                Me.Close()
                Return
            End If
            LogText("[Proxy started on port " & explicitEndPoint.Port & "]")
        Catch ex As Exception
            LogText("[Error]" & vbNewLine & ex.Message)
        End Try
    End Sub

    Private Sub Form1_Closing(sender As Object, e As CancelEventArgs) Handles Me.Closing
        ProxyHB.DisableAllSystemProxies()
    End Sub

    Private Function ProxyHB_BeforeRequest(sender As Object, e As SessionEventArgs) As Task Handles ProxyHB.BeforeRequest
        Dim ReqHost As String = e.HttpClient.Request.Host
        Dim ReqURL As String = e.HttpClient.Request.Url
        If ReqHost.ToLower.StartsWith("habbo.") Or ReqHost.ToLower.StartsWith("www.habbo.") Then
            If ReqURL.ToLower.Contains("api/public/authentication/facebook") Then
                e.HttpClient.Request.Headers.AddHeader("Cache-Control", "no-cache")
            End If
            If ReqURL.ToLower.Contains("api/public/authentication/login") Then
                If (String.IsNullOrWhiteSpace(Authentication) = False) And (String.IsNullOrWhiteSpace(Cookies) = False) Then
                    e.HttpClient.Request.Headers.AddHeader("Cache-Control", "no-cache")
                    If e.GetRequestBodyAsString().Result.Contains("HabboFacebookAIR") Then
                        LogText("[Facebook login requested from HabboAIR]")
                        ValidAuthentication = True
                    Else
                        ValidAuthentication = False
                    End If
                End If
            End If
        End If
    End Function
    Private Function ProxyHB_BeforeResponse(sender As Object, e As SessionEventArgs) As Task Handles ProxyHB.BeforeResponse
        Dim ReqHost As String = e.HttpClient.Request.Host
        Dim ReqURL As String = e.HttpClient.Request.Url
        If ReqHost.ToLower.StartsWith("habbo.") Or ReqHost.ToLower.StartsWith("www.habbo.") Then
            If ReqURL.ToLower.Contains("api/public/authentication/facebook") Then
                Dim AuthenticationTMP As String = e.GetResponseBodyAsString().Result
                If AuthenticationTMP.Contains("uniqueId") Then
                    Authentication = AuthenticationTMP
                    LogText("[Authentication detected]")
                End If
                If e.HttpClient.Response.Headers.HeaderExists("set-cookie") Then
                    Cookies = e.HttpClient.Response.Headers.GetFirstHeader("set-cookie").Value
                    LogText("[Cookies detected]")
                End If
            End If
            If ReqURL.ToLower.Contains("api/public/authentication/login") Then
                If ValidAuthentication = True Then
                    e.HttpClient.Response.StatusCode = 200
                    e.SetResponseBodyString(Authentication)
                    LogText("[Authentication injected]")
                    If e.HttpClient.Response.Headers.HeaderExists("set-cookie") Then
                        e.HttpClient.Response.Headers.RemoveHeader("set-cookie")
                    End If
                    e.HttpClient.Response.Headers.AddHeader("set-cookie", Cookies)
                    LogText("[Cookies injected]")
                    CloseForm()
                End If
            End If
        End If
    End Function

    Public Sub LogText(ByVal NewText As String)
        If InvokeRequired Then
            Me.Invoke(New Action(Of String)(AddressOf LogText), New Object() {NewText})
            Return
        End If
        TextBox1.AppendText(NewText & vbNewLine)
    End Sub

    Public Sub CloseForm()
        If InvokeRequired Then
            Me.Invoke(New MethodInvoker(AddressOf CloseForm))
            Return
        End If
        Me.Close()
    End Sub
End Class
