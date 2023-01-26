import React from "react"
import { hero } from "../assets"
import LayoutFull from "../components/layout/LayoutFull"

const AboutPage = () => {
  return (
    <LayoutFull>
      <section className='flex justify-center text-primary px-6 mt-8'>
        <div className='max-w-[1280px] w-full'>
          <div className='grid grid-cols-1 md:grid-cols-2 gap-4'>
            <img
              src={hero}
              alt='about_us'
              className='rounded-md shadow-lg aspect-video object-cover'
            />
            <div className='text-gray-600'>
              <h3 className='text-3xl underline font-bold text-color1 drop-shadow mb-2'>
                Know Your Neighborhood
              </h3>
              <p className='mb-2'>
                Welcome to "Know Your Neighborhood"! We're a team of locals who
                are passionate about helping people get to know and love their
                community. We know that each neighborhood is unique, which is
                why we've created a website that celebrates the quirks and
                character of the place we call home. From local businesses and
                events, to community resources and news, our goal is to be a
                one-stop-shop for all things local.
              </p>
            </div>
          </div>
        </div>
      </section>
    </LayoutFull>
  )
}

export default AboutPage
