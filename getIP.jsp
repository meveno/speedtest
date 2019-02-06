<%
/*
	This script detects the client's IP address and fetches ISP info from ipinfo.io/
	Output from this script is a JSON string composed of 2 objects: a string called processedString which contains the combined IP, ISP, Contry and distance as it can be presented to the user; and an object called rawIspInfo which contains the raw data from ipinfo.io (will be empty if isp detection is disabled).
	Client side, the output of this script can be treated as JSON or as regular text. If the output is regular text, it will be shown to the user as is.
*/

String ip = null;
if (request.getHeader("X_FORWARDED_FOR") != null) {
    ip = request.getHeader("X_FORWARDED_FOR");
} else if (request.getHeader("HTTP_X_FORWARDED_FOR") != null) {
    ip = request.getHeader("HTTP_X_FORWARDED_FOR");
} else if (request.getHeader("HTTP_CLIENT_IP") != null) {
    ip = request.getHeader("HTTP_CLIENT_IP");
} else if (request.getHeader("WL-Proxy-Client-IP") != null) {
    ip = request.getHeader("WL-Proxy-Client-IP");
} else if (request.getHeader("Proxy-Client-IP") != null) {
    ip = request.getHeader("Proxy-Client-IP");
} else if (request.getHeader("X-Real-IP") != null) {
    ip = request.getHeader("X-Real-IP");
} else if (request.getRemoteAddr() != null) {
    ip = request.getRemoteAddr();
}

response.setHeader("Content-Type", "application/json; charset=utf-8");
out.println("{ \"processedString\": \"" + ip + "\" }");

%>
