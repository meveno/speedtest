<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.io.OutputStream" %>
<%

// Download follows...
response.setHeader("Content-Description", "File Transfer");
response.setHeader("Content-Type", "application/octet-stream");
response.setHeader("Content-Disposition", "attachment; filename=random.dat");
response.setHeader("Content-Transfer-Encoding", "binary");
// Never cache me
response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, max-age=0");
response.setHeader("Cache-Control", "post-check=0, pre-check=0");
response.setHeader("Pragma", "no-cache");

// Generate data
byte[] bytes = new byte[1048576];
SecureRandom.getInstanceStrong().nextBytes(bytes);

// Deliver chunks of 1048576 bytes
String ckSizeParam = request.getParameter("ckSize");
int ckSize = 4;
if (ckSizeParam == null) {
    ckSize = Integer.parseInt(ckSizeParam);
}
if (ckSize > 100) {
    ckSize = 100;
}

OutputStream outStream = response.getOutputStream();
for (int i = 0; i < ckSize; i++) {
    outStream.write(bytes);
    outStream.flush();
}
outStream.close();

%>
