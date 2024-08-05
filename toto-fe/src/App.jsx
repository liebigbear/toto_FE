import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import Star from "./pages/Star"
import Camping from "./pages/Camping"
import NotFound from "./pages/NotFound"

function App() {

    return (
        <Router>
            <Routes>
                <Route path="/1" element={<Star />} />
                <Route path="/2" element={<Camping />} />
                <Route path="*" element={<NotFound />} />
            </Routes>
        </Router>
    )
}

export default App
