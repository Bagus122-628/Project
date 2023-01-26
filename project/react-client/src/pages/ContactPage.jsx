import React from "react"
import LayoutFull from "../components/layout/LayoutFull"

const ContactPage = () => {
  return (
    <LayoutFull>
      <section className='flex justify-center text-primary px-6 mt-8'>
        <div className='max-w-[1280px] w-full'>
          <div className='grid grid-cols-1 gap-5 md:grid-cols-2 md:gap-10'>
            <form className='flex flex-col space-y-5 p-5'>
              <h2 className='font-medium text-xl ml-1'>Ask Question</h2>
              <input
                type='text'
                name='name'
                placeholder='Your name'
                className='px-3 py-2 rounded'
              />
              <input
                type='text'
                name='email'
                placeholder='Your email'
                className='px-3 py-2 rounded'
              />
              <textarea
                name='message'
                placeholder='Your Question'
                className='px-3 py-2 rounded'
              />
              <button type='submit' className='mt-3 rounded bg-color1 py-3'>
                Submit
              </button>
            </form>
            <div className='flex flex-col space-y-5 p-5 text-lg'>
              <h2 className='font-medium text-xl ml-1'>Our Contact</h2>
              <div className='text-center space-y-2 flex flex-row'>
                <i className='fa-sharp fa-solid fa-location-dot text-2xl mr-4' />
                <p className='m-0'> JL. Santai No.69 Jakarta, Indonesia</p>
              </div>
              <div className='text-center space-y-2 flex flex-row '>
                <i className='fa-regular fa-envelope text-2xl mr-4' />
                <p className='m-0'> kyn@dmail.com</p>
              </div>
              <div className='text-center space-y-2  flex flex-row'>
                <i className='fa-solid fa-phone text-2xl mr-4' />
                <p className='m-0'> 0361889911</p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </LayoutFull>
  )
}

export default ContactPage
