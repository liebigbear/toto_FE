import { BrowserRouter as Router, Routes, Route, HashRouter } from "react-router-dom";
import Star from "./pages/Star"
import Camping from "./pages/Camping"
import NotFound from "./pages/NotFound"

function App() {

    return (
        <HashRouter>
            <Routes>
                <Route path="/1" element={<Star />} />
                <Route path="/2" element={<Camping />} />
                <Route path="*" element={<NotFound />} />
            </Routes>
        </HashRouter>
    )
}

export default App
