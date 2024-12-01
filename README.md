<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <h1>Medverse</h1>
    <p>
        Medverse is a hospital management system designed to streamline the day-to-day operations of a healthcare facility. 
        This document provides the steps to set up and run the project.
    </p>
    <hr>
    <h2>How to Run the Medverse Project</h2>
    <ol>
        <li><strong>Download the Zip File</strong>
            <ul>
                <li>Download the Medverse project zip file.</li>
            </ul>
        </li>
        <li><strong>Extract and Copy</strong>
            <ul>
                <li>Extract the downloaded zip file.</li>
                <li>Copy the <code>hospital</code> folder from the extracted files.</li>
            </ul>
        </li>
        <li><strong>Paste into Root Directory</strong>
            <ul>
                <li>Paste the <code>hospital</code> folder into the root directory of your local server. (For <strong>XAMPP</strong>, paste it inside the <code>xampp/htdocs</code> folder.)</li>
            </ul>
        </li>
        <li><strong>Open PHPMyAdmin</strong>
            <ul>
                <li>Open your web browser and go to <a href="http://localhost/phpmyadmin" target="_blank">http://localhost/phpmyadmin</a>.</li>
            </ul>
        </li>
        <li><strong>Create a Database</strong>
            <ul>
                <li>Create a new database with the name <strong>hms</strong>.</li>
            </ul>
        </li>
        <li><strong>Import SQL File</strong>
            <ul>
                <li>Locate the <code>hms.sql</code> file in the <strong>SQL file folder</strong> within the extracted package.</li>
                <li>Import the <code>hms.sql</code> file into the <strong>hms</strong> database using PHPMyAdmin.</li>
            </ul>
        </li>
        <li><strong>Run the Project</strong>
            <ul>
                <li>Open your web browser and run the project by navigating to <a href="http://localhost/hospital" target="_blank">http://localhost/hospital</a>.</li>
            </ul>
        </li>
    </ol>
    <hr>
    <h2>Project Overview</h2>
    <h3>Features</h3>
    <ul>
        <li>Manage patients, doctors, and staff records.</li>
        <li>Schedule appointments and maintain medical records.</li>
        <li>Generate bills and reports for hospital operations.</li>
    </ul>
    <hr>
    <h3>Technologies Used</h3>
    <ul>
        <li><strong>Frontend</strong>: HTML, CSS, JavaScript</li>
        <li><strong>Backend</strong>: PHP</li>
        <li><strong>Database</strong>: MySQL</li>
    </ul>
    <p>Feel free to contribute, report issues, or suggest improvements! 🎉</p>
</body>
</html>
