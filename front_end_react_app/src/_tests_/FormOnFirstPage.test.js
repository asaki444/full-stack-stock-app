import React from 'react'
import {render, fireEvent, screen} from '@testing-library/react';
import FormOnFirstPage from './components/FormOnFirstPage';

test('displays Registration form', () => {
       render( <FormOnFirstPage /> )

       expect(screen.getAllByLabelText('Name :'))
})