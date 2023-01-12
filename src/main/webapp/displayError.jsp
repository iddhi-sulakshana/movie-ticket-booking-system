<%if(session.getAttribute("error") != null){%>
<script defer>
    setTimeout(() => {
        window.alert("<%=session.getAttribute("error")%>")
    }, 1000)
  <%session.removeAttribute("error");%>
</script>
<%}%>