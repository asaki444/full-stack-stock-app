import React from 'react';
import './Error.css';



function Error (props) {
    const {message} = props
    console.log(props)
    return <h3 className="error-message"> {message} </h3>
}

export default Error