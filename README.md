# InterviewAll
A MATLAB-based interview scheduler was developed using the app builder and the database toolbox of MATLAB. The application fetches the calendar data from the users and schedules the interviews with the candidates. 
<h1>Technologies used</h1>
<ul>
  <li>MATLAB</li>
  <li>SQLite</li>
  <li>Outlook API</li>
  <li>actxserver</li>
</ul>
<br>
<h1>Salient features</h1>
<ul>
  <li>The interviewer needs to select the date when the interview is taking place, the code then fetches the free slots from the calendar on that particular date and stores them in the database.</li>
  <li>There are 3 interview rounds to be conducted, and they can be in any order depending on the availability of the interviewer in order to save time.</li>
  <li>The candidate and the interviewers are sent an appointment on Outlook calendar and a mail automatically. </li>
  <li>The Interviewer can update its status to "Idle", "Interviewing" and "Unavailable".</li>
  <li>The domains of the interviewer and the candidates are stored so that the people with matching domains can be paired up for an interview</li>
  <li>The users are classified as "admin" and "interviewers".</li>
  <li>Upload the candidate details using a CSV file to the database. </li>
  <li>API to list all candidates, find a particular candidate, and see the schedule for a particular interviewer.</li>
  <li>Interviewer can update "GO" or "NO GO" for each candidate and also provide its review for a particular round to the student. These details are stored and then can be shared with the candidates.</li>
  <li>There is a login and signup functionality implemented for both, but only an admin can add other admins.</li>

</ul>
<br>
<h1>The scheduling algorithm</h1>
<p>
  Now, at this point the free slots, the interviewers from each department are matched with the domains of the students. These are then scheduled the interviews in the free slots. The scheduler is a function called when:
  <ul>.
    <li>Interviewer updates its status</li>
    <li>New candidates are added to the database.</li>
    <li>A new interviewer is added.</li>
  </ul>
  If an interviewer sets the status as "unavailable", all its meetings are canceled.
</p>
