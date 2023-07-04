Class {
	#name : #BrTextEditorNumericInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #BlocBook
}

{ #category : #accessing }
BrTextEditorNumericInputFilter >> filter: aString [
  ^ aString select: [:c | '-.0123456789' includes:c]
]
