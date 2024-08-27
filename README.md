    <h1>Rick and Morty Characters App</h1>
    <p>This iOS application allows users to explore and filter characters from the popular TV show "Rick and Morty" using data from the <a href="https://rickandmortyapi.com/">Rick and Morty API</a>. The app features character listings with filters for their status (Alive, Dead, Unknown), and uses the Kingfisher library for efficient image loading.</p>

    <h2>Features</h2>
    <ul>
        <li><strong>Character Listing</strong>: Browse through a list of characters from the Rick and Morty universe.</li>
        <li><strong>Status Filters</strong>: Filter characters by their status—Alive, Dead, or Unknown.</li>
        <li><strong>Image Caching</strong>: Efficient image loading and caching using the Kingfisher library.</li>
        <li><strong>Pagination</strong>: Seamlessly load more characters as you scroll through the list.</li>
    </ul>

    <h2>Screenshots</h2>
    <table>
        <tr>
            <th>All Characters</th>
            <th>Filtered: Alive</th>
            <th>Filtered: Dead</th>
            <th>Filtered: Unknown</th>
        </tr>
        <tr>
            <td><img src="Screenshot/screenshot_1.PNG" alt="All Characters" /></td>
            <td><img src="Screenshot/screenshot_2.PNG" alt="Alive Characters" /></td>
            <td><img src="Screenshot/screenshot_3.PNG" alt="Dead Characters" /></td>
            <td><img src="Screenshot/screenshot_4.PNG" alt="Unknown Status Characters" /></td>
        </tr>
    </table>

    <h2>Demo Video</h2>
    <p>Here's a short video demonstrating the app's functionality:</p>
    <video src="Screenshot/video.MP4" controls="controls">
        Your browser does not support the video tag.
    </video>

    <h2>Installation</h2>
    <ol>
        <li>Clone this repository:
            <pre><code>git clone https://github.com/your-username/rick-and-morty-app.git</code></pre>
        </li>
        <li>Navigate to the project directory:
            <pre><code>cd rick-and-morty-app</code></pre>
        </li>
        <li>Install dependencies using CocoaPods:
            <pre><code>pod install</code></pre>
        </li>
        <li>Open the <em>.xcworkspace</em> file in Xcode:
            <pre><code>open RickAndMortyApp.xcworkspace</code></pre>
        </li>
    </ol>

    <h2>Running the Project</h2>
    <ol>
        <li>Ensure you have Xcode installed on your Mac.</li>
        <li>Open the project workspace <em>RickAndMortyApp.xcworkspace</em> in Xcode.</li>
        <li>Select your target device or simulator from the toolbar.</li>
        <li>Build the project by clicking the <em>Build</em> button (or pressing <code>Cmd + B</code>).</li>
        <li>Once the build succeeds, click the <em>Run</em> button (or press <code>Cmd + R</code>) to install and run the app on the selected device or simulator.</li>
    </ol>
    
        <h2>Running UnitTest</h2>
    <ol>
        <li>Build the project by clicking the <em>Build</em> button (or pressing <code>Cmd + B</code>).</li>
        <li>Once the build succeeds or press <code>Cmd + U</code> to install run the integrated tests</li>
    </ol>

    <h2>Dependencies</h2>
    <ul>
        <li><a href="https://github.com/onevcat/Kingfisher">Kingfisher</a>: A powerful, pure-Swift library for downloading and caching images from the web.</li>
    </ul>

