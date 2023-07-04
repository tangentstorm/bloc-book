Class {
	#name : #BbSlider,
	#superclass : #BlElement,
	#instVars : [
		'track',
		'cursor',
		'onDataChanged'
	],
	#category : #BlocBook
}

{ #category : #accessing }
BbSlider >> data [
 ^ cursor position x / track width
]

{ #category : #accessing }
BbSlider >> data: aNumber [
  |x|
  x := aNumber beBetween: 0 and: 1.
  cursor relocate: x * track width @ 4.
  self changed: x.  
]

{ #category : #initialization }
BbSlider >> dataChanged [
  onDataChanged ifNotNil: [:aBlock|
    aBlock value: self data].
]

{ #category : #initialization }
BbSlider >> defaultCursor [
  ^ BlElement new size: 8@16;
    background: Color veryLightGray;
    border: Color black.
]

{ #category : #initialization }
BbSlider >> defaultTrack [
  ^ BlElement new size: 256@1;
    border: (BlBorder builder
      paint: Color veryLightGray;
      width: 2; dashed; build)
]

{ #category : #initialization }
BbSlider >> initialize [
  super initialize.
  track := self defaultTrack.
  cursor := self defaultCursor 
    addEventHandler:
      BlPullHandler new disallowOutOfBounds beHorizontal;
    when: BlPullEvent do: [ self dataChanged].
  ^ self
    addChild: (track relocate: 8@12) as: #track;
    addChild: (cursor relocate: 0@4) as: #cursor;
    size: 256@16 + 8;
    padding: 8
  
]

{ #category : #accessing }
BbSlider >> onDataChanged: anObject [
	onDataChanged := anObject
]
