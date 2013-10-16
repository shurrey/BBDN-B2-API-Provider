<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="com.blackboard.developer.apisample.api.B2ApiSample,
				 com.blackboard.developer.apisample.impl.B2ApiSampleImpl,
				 blackboard.platform.context.*,
				 blackboard.data.course.*,
				 blackboard.data.user.*,
				 java.util.*" %>

<%@ taglib uri="/bbNG" prefix="bbNG" %>

<bbNG:genericPage title="Course Listing">
	<bbNG:pageHeader>
		<bbNG:breadcrumbBar>
			<bbNG:breadcrumb>Course Listing</bbNG:breadcrumb>
		</bbNG:breadcrumbBar>
		<bbNG:pageTitleBar>Course Listing</bbNG:pageTitleBar>
	</bbNG:pageHeader>
	
	<%
	try {
		%>Get Context...<% 
		Context ctx = ContextManagerFactory.getInstance().getContext();
		%>Get B2ApiSample...<%
		B2ApiSample apiSample = new B2ApiSampleImpl();
		%>Get User From Context...<%
		User user = ctx.getUser();
		
		%>
		<h2>Course List for User <%=user.getGivenName()%> <%=user.getFamilyName() %></h2><br />
		<%
		%>Get Course List...<%
		List<Course> courseListing = apiSample.getCourseListForUser(ctx.getUserId());
		%>Get Course List Iterator...<%
		ListIterator<Course> courseIt = courseListing.listIterator();
		
		while(courseIt.hasNext()) {
			Course course = courseIt.next();
			String displayCourse = "Course Name: <" + course.getDisplayTitle() + "> Course Id: <" + course.getCourseId() +
					"> Course BatchUId: <" + course.getBatchUid() + ">";
			%>
			<%=displayCourse%><br />
			<%
		}
	} catch(Exception e) {
		%><%=e.getMessage() %><%
	}
	%>
</bbNG:genericPage>