Class {
	#name : #BbTextEditorNumericInputFilter,
	#superclass : #BrTextEditorInputFilter,
	#category : #BlocBook
}

{ #category : #accessing }
BbTextEditorNumericInputFilter >> filter: aString [
  ^ aString select: [:c | '-.0123456789' includes:c]
]
