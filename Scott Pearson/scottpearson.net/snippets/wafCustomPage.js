export default {
    async fetch(request) {
      // Get dynamic values from the request
      const hostname = request.headers.get('host') || new URL(request.url).hostname || 'unknown-host';
      const timestamp = new Date().toISOString();
      const currentYear = new Date().getFullYear();
  
      // This is the HTML content for the 403 error page.
      const html = `
  <!DOCTYPE html>
  <html lang="en">
  <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>403 Forbidden - Scott Pearson</title>
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
              border-top: 4px solid #dc3545;
          }
          h1 {
              color: #dc3545;
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
          <h1>🚫 403 - Access Denied</h1>
          <p>Sorry, you don't have permission to access this page. This is usually because the resource is protected or your request was blocked by a security rule.</p>
          <div class="diagnostics">
              <h2>Diagnostic Information</h2>
              <p>If you believe this is an error, please provide the following details when contacting support.</p>
              <ul>
                  <li><strong>Domain:</strong> ${hostname}</li>
                  <li><strong>Your IP Address:</strong> ::CLIENT_IP::</li>
                  <li><strong>Cloudflare Ray ID:</strong> ::RAY_ID::</li>
                  <li><strong>Your Region:</strong> ::GEO::</li>
                  <li><strong>Timestamp (UTC):</strong> ${timestamp}</li>
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
  
      // Return the response
      return new Response(html, {
        status: 403,
        headers: {
          'Content-Type': 'text/html; charset=utf-8',
        },
      });
    }
  };
