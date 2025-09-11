export default {
  async fetch(request) {
    // Get dynamic values from the request object and cf properties
    const currentYear = new Date().getFullYear();

    // This is the HTML content for the Cloudflare-themed error page.
    const html = `
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Connection Error - Scott Pearson</title>
    <style>
        body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            text-align: center;
        }
        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 650px;
            width: 100%;
            /* Use Cloudflare's orange for branding */
            border-top: 4px solid #f38020;
        }
        h1 {
            /* Use Cloudflare's orange for branding */
            color: #f38020;
            font-size: 2.5em;
            margin-top: 0;
        }
        .diagnostics {
            background: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            margin: 20px 0;
            text-align: left;
        }
        .contact {
            margin: 20px 0;
        }
        ul {
            text-align: left;
            padding-left: 0;
            list-style: none;
        }
        li {
            margin-bottom: 8px;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        footer {
            margin-top: 30px;
            font-size: 0.85em;
            color: #6c757d;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>☁️ 1xxx Connection Error</h1>
        <p>There seems to be an issue with the connection between Cloudflare and the origin web server, resulting in the page not being served.</p>
        <div class="diagnostics">
            <h2>Diagnostic Information</h2>
            <p>You can provide these details to our support team to help diagnose the issue.</p>
            <ul>
                <li>::CLOUDFLARE_ERROR_1000S_BOX::</li>
            </ul>
        </div>
        <div class="contact">
            <h2>Need Help?</h2>
            <p>Please contact our support team at: <a href="mailto:support@scottpearson.net">support@scottpearson.net</a></p>
        </div>
        <footer>
            <p>&copy; ${currentYear} Scott Pearson</p>
        </footer>
    </div>
</body>
</html>
`;

    // Return the response. Note: We use a 503 status code here, as 1xxx codes are not valid HTTP statuses for a browser.
    return new Response(html, {
      status: 503,
      headers: {
        'Content-Type': 'text/html; charset=utf-8',
      },
    });
  }
};
