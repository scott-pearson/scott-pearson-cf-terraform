export default {
    async fetch(request) {
      // Get dynamic values from the request object and cf properties
      const timestamp = new Date().toISOString();
      const currentYear = new Date().getFullYear();
  
      // This is the HTML content for the 5xx error page.
      const html = `
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>5xx Server Error - Scott Pearson</title>
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
              /* Use an amber/yellow color for server errors */
              border-top: 4px solid #ffc107;
          }
          h1 {
              /* Use an amber/yellow color for server errors */
              color: #ffc107;
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
          <h1>⚙️ 5xx - Server Error</h1>
          <p>We're sorry, but something went wrong on our end. Our team has been notified and is working to fix the problem.</p>
          <div class="diagnostics">
              <h2>Diagnostic Information</h2>
              <p>This information can help our team diagnose the issue. If you contact support, please provide these details.</p>
              <ul>
                  <li>::CLOUDFLARE_ERROR_500S_BOX::</li>
                  <li>Timestamp (UTC):</strong> ${timestamp}</li>
              </ul>
          </div>
          <div class="contact">
              <h2>Need Help?</h2>
              <p>If the problem persists, please contact our support team at: <a href="mailto:support@scottpearson.net">support@scottpearson.net</a></p>
          </div>
          <footer>
              <p>&copy; ${currentYear} Scott Pearson</p>
          </footer>
      </div>
  </body>
  </html>
  `;
  
      // Return the response with a 500 status code
      return new Response(html, {
        status: 500,
        headers: {
          'Content-Type': 'text/html; charset=utf-8',
        },
      });
    }
  };
