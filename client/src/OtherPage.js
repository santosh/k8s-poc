import React from 'react'
import { Link } from 'react-router-dom'

export default () => {
  return (
    <div>
      <p>Hello from other page.</p>
      <Link to="/">Go back home</Link>
    </div>
  )
}
