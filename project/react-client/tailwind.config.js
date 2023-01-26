/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./public/index.html", "./src/**/*.{js,jsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#000000",
        secondary: "#14213d",
        color1: "#fca311",
        color2: "#e5e5e5",
      },
      fontFamily: {
        inter: ["'Inter'", "sans-serif"],
        poppins: ["Poppins"],
      },
    },
  },
  plugins: [],
}
